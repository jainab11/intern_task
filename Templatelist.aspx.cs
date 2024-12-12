using System;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Newsletter
{
    public partial class Templatelist : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Templates";
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gv.DataSource = dt;
                    gv.DataBind();
                }
            }
        }

        // Handler for deleting a template
        protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gv.DataKeys[e.RowIndex].Value);  // Get TemplateID
            DeleteTemplate(id);  // Call the Delete method
        }

        // Delete the template from the database
        private void DeleteTemplate(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Define the delete query
                string deleteQuery = "DELETE FROM Templates WHERE TemplateID = @TemplateID";

                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@TemplateID", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            BindGridView();  // Rebind the GridView to reflect the changes
        }

        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
            BindGridView();  // Rebind the GridView after page index change
        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Copy")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                CopyTemplate(id);
            }
        }

        private void CopyTemplate(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Fetch the template details for the selected template
                string selectQuery = "SELECT LayoutName, EmailTitle, HTMLHeader, ContentHTML, ContentText FROM Templates WHERE TemplateID = @TemplateID";
                using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                {
                    cmd.Parameters.AddWithValue("@TemplateID", id);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();

                        string layoutName = "New " + reader["LayoutName"].ToString();
                        string emailTitle = reader["EmailTitle"].ToString();
                        string htmlHeader = reader["HTMLHeader"].ToString();
                        string contentHTML = reader["ContentHTML"].ToString();
                        string contentText = reader["ContentText"].ToString();

                        // Close the reader before executing the insert query
                        reader.Close();

                        // Now insert the copied template with the new layout name
                        string insertQuery = "INSERT INTO Templates (CreatedDate, ModifyDate, LayoutName, EmailTitle, HTMLHeader, ContentHTML, ContentText) " +
                                             "VALUES (@CreatedDate, @ModifyDate, @LayoutName, @EmailTitle, @HTMLHeader, @ContentHTML, @ContentText)";

                        using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                        {
                            insertCmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                            insertCmd.Parameters.AddWithValue("@ModifyDate", DateTime.Now);
                            insertCmd.Parameters.AddWithValue("@LayoutName", layoutName);
                            insertCmd.Parameters.AddWithValue("@EmailTitle", emailTitle);
                            insertCmd.Parameters.AddWithValue("@HTMLHeader", htmlHeader);
                            insertCmd.Parameters.AddWithValue("@ContentHTML", contentHTML);
                            insertCmd.Parameters.AddWithValue("@ContentText", contentText);

                            insertCmd.ExecuteNonQuery();
                        }
                    }
                }
            }
            BindGridView();
        }
    }
}
