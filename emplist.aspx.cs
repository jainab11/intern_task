using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Newsletter
{
    public partial class emplist : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView("SELECT * FROM EMPLOYEE");
                BindFilterOptions();
            }
        }

        void BindGridView(string query)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                gvEmployees.DataSource = data;
                gvEmployees.DataBind();
            }
        }

        protected void ChkHeader_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkHeader = (CheckBox)gvEmployees.HeaderRow.FindControl("ChkHeader");
            foreach (GridViewRow row in gvEmployees.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("ChkEmpty");
                if (chkRow != null)
                {
                    chkRow.Checked = chkHeader.Checked;
                }
            }
        }

        protected void btsearch_Click(object sender, EventArgs e)
        {
            string searchText = txtsearchh.Text.Trim();
            StringBuilder query = new StringBuilder("SELECT * FROM EMPLOYEE WHERE 1=1");

            if (!string.IsNullOrEmpty(searchText))
            {
                query.Append(" AND (EMP_NAME LIKE @searchText OR EMP_EMAILID LIKE @searchText OR DEPARTMENT LIKE @searchText OR DESIGNATION LIKE @searchText OR REGION LIKE @searchText OR COUNTRY LIKE @searchText)");
            }
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query.ToString(), con);
                cmd.Parameters.AddWithValue("@searchText", "%" + searchText + "%");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvEmployees.DataSource = dt;
                gvEmployees.DataBind();

                lblMessage.Visible = dt.Rows.Count == 0;
                lblMessage.Text = dt.Rows.Count == 0 ? "No records found." : string.Empty;
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            DeleteSelectedRecords();
        }

        protected void btDeleteAlll_Click(object sender, EventArgs e)
        {
            DeleteSelectedRecords();
        }

        void DeleteSelectedRecords()
        {
            bool isSelected = false;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                foreach (GridViewRow row in gvEmployees.Rows)
                {
                    CheckBox chkRow = (CheckBox)row.FindControl("ChkEmpty");
                    if (chkRow != null && chkRow.Checked)
                    {
                        isSelected = true;
                        int empId = Convert.ToInt32(gvEmployees.DataKeys[row.RowIndex].Value);
                        string query = "DELETE FROM EMPLOYEE WHERE EMP_ID = @EMP_ID";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@EMP_ID", empId);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }

            if (isSelected)
            {
                BindGridView("SELECT * FROM EMPLOYEE");
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Selected records deleted successfully.');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please select at least one record to delete.');", true);
            }
        }

        protected void txtAddEmp_Click(object sender, EventArgs e)
        {
            Response.Redirect("addEmp.aspx?mode=insert");
        }

        protected void btEdit_Click1(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string empId = btn.CommandArgument;
            Response.Redirect($"AddEmp.aspx?mode=edit&id={empId}");
        }

        void BindFilterOptions()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                BindRepeater(con, "SELECT DISTINCT DEPARTMENT FROM EMPLOYEE", rptDepartment);
                BindRepeater(con, "SELECT DISTINCT DESIGNATION FROM EMPLOYEE", rptDesignation);
                BindRepeater(con, "SELECT DISTINCT LOCATION FROM EMPLOYEE", rptLocation);
                BindRepeater(con, "SELECT DISTINCT REGION FROM EMPLOYEE", rptRegion);
                BindRepeater(con, "SELECT DISTINCT COUNTRY FROM EMPLOYEE", rptCountry);
            }
        }

        void BindRepeater(SqlConnection con, string query, Repeater repeater)
        {
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            repeater.DataSource = dt;
            repeater.DataBind();
        }

        protected void btFilters_Click(object sender, EventArgs e)
        {
            List<string> filters = new List<string>();

            AddFilterFromRepeater(rptDepartment, "DEPARTMENT", filters);
            AddFilterFromRepeater(rptDesignation, "DESIGNATION", filters);
            AddFilterFromRepeater(rptLocation, "LOCATION", filters);
            AddFilterFromRepeater(rptRegion, "REGION", filters);
            AddFilterFromRepeater(rptCountry, "COUNTRY", filters);

            string whereClause = filters.Count > 0 ? " WHERE " + string.Join(" AND ", filters) : string.Empty;
            string query = "SELECT * FROM EMPLOYEE" + whereClause;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);


                gvEmployees.DataSource = dt;
                gvEmployees.DataBind();


                if (dt.Rows.Count == 0)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "No records found.";
                }
                else
                {
                    lblMessage.Visible = false;
                }
            }
        }

        void AddFilterFromRepeater(Repeater repeater, string columnName, List<string> filters)
        {
            foreach (RepeaterItem item in repeater.Items)
            {
                CheckBox chk = (CheckBox)item.FindControl($"chk{columnName}");
                if (chk != null && chk.Checked)
                {
                    filters.Add($"{columnName} = '{chk.Text}'");
                }
            }
        }
        protected void gvEmployees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEmployees.PageIndex = e.NewPageIndex;
            BindGridView("SELECT * FROM EMPLOYEE");
        }

    }
}