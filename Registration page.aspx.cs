    using System;
    using System.Configuration;
    using System.Data.SqlClient;
    using System.Security.Cryptography;
    using System.Text;
    using System.Web.UI;

    namespace Newsletter
    {
        public partial class Registration_page : System.Web.UI.Page
        {
            // Connection string retrieved from the configuration file
            string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;

            protected void Page_Load(object sender, EventArgs e)
            {
                // No specific logic needed for Page Load currently
            }

            protected void BtnSubmit_Click(object sender, EventArgs e)
            {
                string name = TxtName.Text;
                string email = TxtEmail.Text;
                string password = TxtPassword.Text;

                // Generate a salt and hash the password
                string salt = GenerateSalt();
                string hashedPassword = HashString(password + salt);

                string query = "INSERT INTO REGISTER (NAME, EMAIL, PASSWORD, SALT) VALUES(@NAME, @EMAIL, @PASSWORD, @SALT)";
                string checkQuery = "SELECT COUNT(*) FROM REGISTER WHERE EMAIL = @EMAIL";

                try
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();

                        // Check if the email is already registered
                        using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                        {
                            checkCmd.Parameters.AddWithValue("@EMAIL", email);
                            int userCount = (int)checkCmd.ExecuteScalar();

                            if (userCount > 0)
                            {
                                Response.Write("<script>alert('Email already registered.');</script>");
                                return;
                            }
                        }

                        // Insert new user into the database
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@NAME", name);
                            cmd.Parameters.AddWithValue("@EMAIL", email);
                            cmd.Parameters.AddWithValue("@PASSWORD", hashedPassword);
                            cmd.Parameters.AddWithValue("@SALT", salt);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Redirect to Login page after successful registration
                    Response.Write("<script>alert('Registration successful.');</script>");
                    Response.Redirect("Login.aspx");
                }
                catch (SqlException sqlEx)
                {
                    if (sqlEx.Number == 2627) // Unique constraint violation
                    {
                        Response.Write("<script>alert('The email address is already registered. Please use a different email.');</script>");
                    }
                    else
                    {
                        Response.Write($"<script>alert('An error occurred: {sqlEx.Message}');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('An unexpected error occurred: {ex.Message}');</script>");
                }
            }

            // Generate a unique salt using GUID
            private string GenerateSalt()
            {
                return Guid.NewGuid().ToString();
            }

            // Hash the input string using SHA256
            public static string HashString(string input)
            {
                StringBuilder sb = new StringBuilder();
                foreach (byte b in GetHash(input))
                {
                    sb.Append(b.ToString("X2"));
                }
                return sb.ToString();
            }

            // Compute the hash of the input string using SHA256
            public static byte[] GetHash(string input)
            {
                using (HashAlgorithm algorithm = SHA256.Create())
                {
                    return algorithm.ComputeHash(Encoding.UTF8.GetBytes(input));
                }
            }
        }
    }