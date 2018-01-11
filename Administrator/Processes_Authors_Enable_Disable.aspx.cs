using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

public partial class Processes_Authors_Enable_Disable : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        // Set the page title.
        Master.PageTitle = "Enable/Disable Authors";

        if (!IsPostBack)
        {
            // Set the message.
            Master.MessageForeColor = System.Drawing.Color.Green;
            Master.Message = "Please select from the options below.";
        }

    }

    protected void btnMenu_Click(object sender, EventArgs e)
    {

        // Redirect the user.
        Response.Redirect("Options_Display.aspx");

    }

    protected void btnEnable_Click(object sender, EventArgs e)
    {
        // Add code here.
        string cs = ConfigurationManager.ConnectionStrings["CPMS"].ConnectionString;

        try
        {
            string strSQL;
            strSQL = "UPDATE Defaults";
            strSQL += " SET";
            strSQL += " EnabledAuthors = '1'";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            this.Master.MessageForeColor = System.Drawing.Color.Green;
            this.Master.Message = "Authors sucessfully enabled.";

        }
        catch (Exception ex)
        {
            // Handle the error
            this.Master.Message = ex.ToString();
        }
    }

    protected void btnDisable_Click(object sender, EventArgs e)
    {
        // Add code here.
        string cs = ConfigurationManager.ConnectionStrings["CPMS"].ConnectionString;

        try
        {
            String strSQL;
            strSQL = "UPDATE Defaults";
            strSQL += " SET";
            strSQL += " EnabledAuthors = '0'";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            this.Master.MessageForeColor = System.Drawing.Color.Green;
            this.Master.Message = "Authors sucessfully disabled.";

        }
        catch (Exception ex)
        {
            // Handle the error
            this.Master.Message = ex.ToString();
        }
    }

}