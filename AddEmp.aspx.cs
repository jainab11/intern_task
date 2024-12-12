using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Newsletter
{
    public partial class AddEmp : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string mode = Request.QueryString["mode"];
                string empIdStr = Request.QueryString["id"];
                if (mode == "edit" && !string.IsNullOrEmpty(empIdStr))
                {

                    int empId = Convert.ToInt32(empIdStr);
                    LoadEmployeeData(empId);
                    btnUpdate.Visible = true;
                    btInsert.Visible = false;
                }
                else
                {

                    btnUpdate.Visible = false;
                    btInsert.Visible = true;
                }
            }
        }

        private void LoadEmployeeData(int empId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM EMPLOYEE WHERE EMP_ID = @EMP_ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EMP_ID", empId);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {

                    txtname.Text = dt.Rows[0]["EMP_NAME"].ToString();
                    txtemail.Text = dt.Rows[0]["EMP_EMAILID"].ToString();
                    txtdept.Text = dt.Rows[0]["DEPARTMENT"].ToString();
                    txtdesignation.Text = dt.Rows[0]["DESIGNATION"].ToString();
                    ddlRegions.SelectedValue = dt.Rows[0]["REGION"].ToString();
                    txtcountries.Text = dt.Rows[0]["COUNTRY"].ToString();
                    txtlocation.Text = dt.Rows[0]["LOCATION"].ToString();

                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int empId = Convert.ToInt32(Request.QueryString["id"]);
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE EMPLOYEE SET EMP_NAME = @EMP_NAME, EMP_EMAILID = @EMP_EMAILID, DEPARTMENT = @DEPARTMENT, DESIGNATION=@DESIGNATION, REGION=@REGION, COUNTRY=@COUNTRY, LOCATION=@LOCATION WHERE EMP_ID = @EMP_ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EMP_NAME", txtname.Text);
                cmd.Parameters.AddWithValue("@EMP_EMAILID", txtemail.Text);
                cmd.Parameters.AddWithValue("@DEPARTMENT", txtdept.Text);
                cmd.Parameters.AddWithValue("@DESIGNATION", txtdesignation.Text);
                cmd.Parameters.AddWithValue("@REGION", ddlRegions.SelectedValue);
                cmd.Parameters.AddWithValue("@COUNTRY", txtcountries.Text);
                cmd.Parameters.AddWithValue("@LOCATION", txtlocation.Text);

                cmd.Parameters.AddWithValue("@EMP_ID", empId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("emplist.aspx");
            }
        }
        protected void btInsert_Click(object sender, EventArgs e)
        {
            string employeeName = txtname.Text;
            string employeeEmail = txtemail.Text;
            string department = txtdept.Text;
            string designation = txtdesignation.Text;
            string region = ddlRegions.SelectedValue;
            string country = txtcountries.Text;
            string location = txtlocation.Text;

            try
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "INSERT INTO EMPLOYEE (EMP_NAME, EMP_EMAILID, DEPARTMENT, DESIGNATION, REGION, COUNTRY, LOCATION) " +
                               "VALUES (@EMP_NAME, @EMP_EMAILID, @DEPARTMENT, @DESIGNATION, @REGION, @COUNTRY, @LOCATION)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EMP_NAME", employeeName);
                    cmd.Parameters.AddWithValue("@EMP_EMAILID", employeeEmail);
                    cmd.Parameters.AddWithValue("@DEPARTMENT", department);
                    cmd.Parameters.AddWithValue("@DESIGNATION", designation);
                    cmd.Parameters.AddWithValue("@REGION", region);
                    cmd.Parameters.AddWithValue("@COUNTRY", country);
                    cmd.Parameters.AddWithValue("@LOCATION", location);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

            
                Response.Write("<script>alert('registered successfully!');window.location='emplist.aspx';</script>");

                Response.Write("<script>alert('');</script>");
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

    }
}