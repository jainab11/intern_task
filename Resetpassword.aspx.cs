using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Newsletter
{
    public partial class Resetpassword : System.Web.UI.Page
    {
        string connstring = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string token = Request.QueryString["token"];
            if (string.IsNullOrEmpty(token))
            {
                lblFeedback.Text = "Invalid token.";
                lblFeedback.CssClass = "text-danger";
                return;
            }

          
            using (SqlConnection con = new SqlConnection(connstring))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT EMAIL, TokenExpiry FROM REGISTER WHERE ResetToken = @Token", con);
                cmd.Parameters.AddWithValue("@Token", token);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    DateTime tokenExpiry = Convert.ToDateTime(dr["TokenExpiry"]);
                    if (tokenExpiry < DateTime.Now)
                    {
                        lblFeedback.Text = "The password reset link has expired.";
                        lblFeedback.CssClass = "text-danger";
                    }
                    else
                    {
                        
                        txtEmail.Text = dr["EMAIL"].ToString(); 
                    }
                }
                else
                {
                    lblFeedback.Text = "Invalid token.";
                    lblFeedback.CssClass = "text-danger";
                }
            }
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            string newPassword = txtnewpass.Text.Trim();
            string confirmPassword = txtconpass.Text.Trim();

            lblFeedback.Text = "";
            lblFeedback.CssClass = "";

            if (string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                lblFeedback.Text = "Both fields are required.";
                lblFeedback.CssClass = "text-danger";
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblFeedback.Text = "Passwords do not match.";
                lblFeedback.CssClass = "text-danger";
                return;
            }

            
            string salt = GenerateSalt();
            string hashedPassword = HashString(newPassword + salt);

            string email = txtEmail.Text.Trim(); 
            string query = "UPDATE REGISTER SET PASSWORD = @PASSWORD, SALT = @SALT WHERE EMAIL = @EMAIL";

            try
            {
                using (SqlConnection con = new SqlConnection(connstring))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PASSWORD", hashedPassword);
                        cmd.Parameters.AddWithValue("@SALT", salt);
                        cmd.Parameters.AddWithValue("@EMAIL", email);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblFeedback.Text = "Password reset successfully!";
                            lblFeedback.CssClass = "text-success";

                            // Optionally, clear the form fields after successful reset
                            txtnewpass.Text = string.Empty;
                            txtconpass.Text = string.Empty;
                        }
                        else
                        {
                            lblFeedback.Text = "No account found with the provided email.";
                            lblFeedback.CssClass = "text-danger";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblFeedback.Text = $"An error occurred: {ex.Message}";
                lblFeedback.CssClass = "text-danger";
            }
        }

        
        private string GenerateSalt()
        {
            return Guid.NewGuid().ToString();
        }

        
        private string HashString(string input)
        {
            StringBuilder sb = new StringBuilder();
            foreach (byte b in GetHash(input))
            {
                sb.Append(b.ToString("X2"));
            }
            return sb.ToString();
        }

        
        private byte[] GetHash(string input)
        {
            using (HashAlgorithm algorithm = SHA256.Create())
            {
                return algorithm.ComputeHash(Encoding.UTF8.GetBytes(input));
            }
        }
    }
}
