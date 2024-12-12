using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Newsletter
{
    public partial class Template : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string templateId = Request.QueryString["TemplateID"];
                if (!string.IsNullOrEmpty(templateId))
                {
                    LoadTemplateDetails(templateId);
                    btnUpdate.Visible = true;
                    btnsubmit.Visible = false; btncancel.Visible = true;
                }
            }
        }

        private void LoadTemplateDetails(string templateId)
        {
            string query = "SELECT * FROM Templates WHERE TemplateID = @TemplateID";

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TemplateID", templateId);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        name.Text = reader["LayoutName"].ToString();
                        subject.Text = reader["EmailTitle"].ToString();
                        header_html.InnerText = reader["HTMLHeader"].ToString();
                        basicConf.InnerText = reader["ContentHTML"].ToString();
                        mailtxt.InnerText = reader["ContentText"].ToString();
                    }
                }
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string layoutName = name.Text;
            string emailTitle = subject.Text;
            string htmlHeader = header_html.InnerText;

            string contentHtml = Request.Unvalidated.Form["basicConf"] ?? string.Empty;
            string contentText = mailtxt.InnerText;

            string thumbnailPath = "";
            if (FileUpload1.HasFile)
            {
                thumbnailPath = "/img/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(thumbnailPath));
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "INSERT INTO Templates (LayoutName, EmailTitle, HTMLHeader, ContentHTML, ContentText, Thumbnail) " +
                               "VALUES (@LayoutName, @EmailTitle, @HTMLHeader, @ContentHTML, @ContentText, @Thumbnail)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {

                    cmd.Parameters.AddWithValue("@LayoutName", layoutName);
                    cmd.Parameters.AddWithValue("@EmailTitle", emailTitle);
                    cmd.Parameters.AddWithValue("@HTMLHeader", htmlHeader);
                    cmd.Parameters.AddWithValue("@ContentHTML", contentHtml);
                    cmd.Parameters.AddWithValue("@ContentText", contentText);
                    cmd.Parameters.AddWithValue("@Thumbnail", thumbnailPath);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("Templatelist.aspx");
                }
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Templatelist.aspx");
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login1.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            // Implement logout functionality if needed.
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string layoutName = name.Text;
            string emailTitle = subject.Text;
            string htmlHeader = header_html.InnerText;

            string contentHtml = Request.Unvalidated.Form["basicConf"] ?? string.Empty;
            string contentText = mailtxt.InnerText;

            string thumbnailPath = "";
            if (FileUpload1.HasFile)
            {
                thumbnailPath = "/img/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(thumbnailPath));
            }

            string templateId = Request.QueryString["TemplateID"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query;

                // Check if no new image is uploaded
                if (string.IsNullOrEmpty(thumbnailPath))
                {
                    query = "UPDATE Templates SET LayoutName = @LayoutName, EmailTitle = @EmailTitle, " +
                            "HTMLHeader = @HTMLHeader, ContentHTML = @ContentHTML, ContentText = @ContentText " +
                            "WHERE TemplateID = @TemplateID";
                }
                else
                {
                    query = "UPDATE Templates SET LayoutName = @LayoutName, EmailTitle = @EmailTitle, " +
                            "HTMLHeader = @HTMLHeader, ContentHTML = @ContentHTML, ContentText = @ContentText, " +
                            "Thumbnail = @Thumbnail WHERE TemplateID = @TemplateID";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@LayoutName", layoutName);
                    cmd.Parameters.AddWithValue("@EmailTitle", emailTitle);
                    cmd.Parameters.AddWithValue("@HTMLHeader", htmlHeader);
                    cmd.Parameters.AddWithValue("@ContentHTML", contentHtml);
                    cmd.Parameters.AddWithValue("@ContentText", contentText);

                    if (!string.IsNullOrEmpty(thumbnailPath))
                    {
                        cmd.Parameters.AddWithValue("@Thumbnail", thumbnailPath);
                    }

                    cmd.Parameters.AddWithValue("@TemplateID", templateId);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("Templatelist.aspx");
                }
            }
        }

    }
}

