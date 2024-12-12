using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Newsletter
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                string email = TxtEmail.Text.Trim();
                string password = TxtPassword.Text.Trim();



                // Query to retrieve the stored hashed password and salt for the given email
                string query = "SELECT PASSWORD,SALT  FROM REGISTER WHERE EMAIL = @EMAIL";



                string storedHashedPassword = null;
                string storedSalt = null;



                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@EMAIL", email);
                    SqlDataReader reader = cmd.ExecuteReader();



                    if (reader.HasRows)
                    {
                        reader.Read();
                        storedHashedPassword = reader["PASSWORD"].ToString();
                        storedSalt = reader["SALT"].ToString();
                    }



                   
                    con.Close();
                }



                if (storedHashedPassword != null && storedSalt != null)
                {



                    string enteredHashedPassword = HashString(password + storedSalt);





                    if (storedHashedPassword == enteredHashedPassword)
                    {
                        Session["email"] = email;
                        Response.Redirect("dashboard.aspx");
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {

                        LblError.Text = "Invalid email or password.";
                        LblError.Style["display"] = "block";
                    }
                }
                else
                {
                    // User not found
                    LblError.Text = "User not found.";
                    LblError.Style["display"] = "block";
                }
            }
            catch (Exception ex)
            {
                string errorMessage = "An error occurred: " + ex.Message;
                if (ex.InnerException != null)
                {
                    errorMessage += "<br/>Inner exception: " + ex.InnerException.Message;
                }



                LblError.Text = errorMessage + "<br/>" + ex.StackTrace;
                LblError.Style["display"] = "block";
            }
        }



        public static string HashString(string input)
        {
            StringBuilder sb = new StringBuilder();
            foreach (byte b in GetHash(input))
            {
                sb.Append(b.ToString("X2"));
            }
            return sb.ToString();
        }



        public static byte[] GetHash(string input)
        {
            using (HashAlgorithm algorithm = SHA256.Create())
            {
                return algorithm.ComputeHash(Encoding.UTF8.GetBytes(input));
            }
        }
    }
}