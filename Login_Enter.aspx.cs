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

public partial class Login_Enter : System.Web.UI.Page
{
    int EnableAuthors;
    int EnableReviewers;

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckAuthorAndReviewer();
        this.Master.LogoutText = "";

        if (!IsPostBack)
        {
            // End the session.
            Session.Clear();
            Session.Abandon();
        }

        // Set the user.
        Session["strUser"] = "User [Role]";

        // Set the page title.
        Master.PageTitle = "Login";

        if (!IsPostBack)
        {

            // Reviewers disabled
            if (EnableReviewers == 0 && EnableAuthors == 1)
            {
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "The paper review period for this year's conference is closed. Reviewers are not permitted to access the system at this time.";
                radReviewer.Enabled = false;
                radAuthor.Enabled = true;
                btnRegisterAsReviewer.Enabled = false;
            }
            // Authors disabled
            else if (EnableReviewers == 1 && EnableAuthors == 0)
            {
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "The paper submission period for this year's conference is closed. Authors are not permitted to access the system at this time.";
                radAuthor.Enabled = false;
                radReviewer.Enabled = true;
                btnRegisterAsAuthor.Enabled = false;
            }
            // Both disabled
            else if (EnableReviewers == 0 && EnableAuthors == 0)
            {
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "Both the paper review period and the paper submission period for this year's conference are closed. Reviwers and authors are not permitted to access the system at this time.";             
                radAuthor.Enabled = false;
                radReviewer.Enabled = false;
                btnRegisterAsAuthor.Enabled = false;
                btnRegisterAsReviewer.Enabled = false;
            }
            else
            {
                this.Master.MessageForeColor = System.Drawing.Color.Green;
                this.Master.Message = "Please Login.";
                radReviewer.Enabled = true;
                radAuthor.Enabled = true;
            }

        }
        // Set the focus.
        txtEmailAddress.Focus();

    }
    protected void CheckAuthorAndReviewer()
    {
        try
        {
            string strSQL;
            strSQL = "SELECT EnabledAuthors, EnabledReviewers";
            strSQL += " FROM  Defaults ";

            string cs = ConfigurationManager.ConnectionStrings["CPMS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            con.Open();

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    EnableAuthors = Convert.ToInt16(reader["EnabledAuthors"]);
                    EnableReviewers = Convert.ToInt16(reader["EnabledReviewers"]);

                }
            }
            con.Close();

        }
        catch (Exception ex)
        {
            this.Master.Message = ex.ToString();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        // Login the user.
        if (radAdministrator.Checked)
        {
            Login_Administrator();
        }
        else if (radReviewer.Checked)
        {
            Login_Reviewer();
        }
        else if (radAuthor.Checked)
        {
            Login_Author();
        }

    }

    protected void Login_Administrator()
    {
        if (txtEmailAddress.Text == "ssmith@ccscmw.org" && txtPassword.Text == "abc")
        {
            // Add code here.
            Session["strUser"] = "Steve Smith [Administrator]";
            // Redirect the user.
            Response.Redirect("Administrator/Options_Display.aspx");
        }
        else
        {
            // Add code here.
            this.Master.MessageForeColor = System.Drawing.Color.Red;
            this.Master.Message = "Invalid email address and password combination. Please try again.";
        }

    }

    protected void Login_Reviewer()
    {
        // Do not code.
    }

    protected void Login_Author()
    {
        // Do not code.
    }

    protected void btnSendPassword_Click(object sender, EventArgs e)
    {
        // Do not code.
    }

}