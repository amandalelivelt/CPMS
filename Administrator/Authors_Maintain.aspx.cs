using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Authors_Maintain : System.Web.UI.Page
{

    // Define necessary module-level variables.
    String strTable = "Author";
    Int32 int32NewlyInsertedPrimaryKeyValue;

    protected void Page_Load(object sender, EventArgs e)
    {

        //this.Master.UserName = Session["strUser"].ToString();
        
        // Set the page title.
        Master.PageTitle = "Maintain Authors";

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

    protected void sdsSqlDataSourceFormView_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        // Add code here.
        // Get the primary key value of the newly inserted row so that the newly inserted
        // row can be displayed. This is used in the FormView ItemInserted method to
        // position the associated dropdownlist and formview on the newly inserted row.

        if (e.Exception == null)
        {
            int32NewlyInsertedPrimaryKeyValue =
            (Int32)e.Command.Parameters["@AuthorID"].Value;
        }
    }

    protected void forFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        // Add code here.
        // Make sure the database call was successful.
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                // Set the message.
                this.Master.MessageForeColor = System.Drawing.Color.Green;
                this.Master.Message = "Author successfully added.";
            }
            else
            {
                // Set the message.
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "Author was NOT successfully added. Please report this message to Dr.Robert E. Beasley (rbeasley@franklincollege.edu).";
                e.KeepInInsertMode = true;
            }
            // Refresh the page data.
            ddlAuthor.DataBind();
            ddlAuthor.SelectedValue = int32NewlyInsertedPrimaryKeyValue.ToString();
            forFormView.DataBind();
        }
        else
        {
            // Set the message. (Generic database problem.)
            this.Master.MessageForeColor = System.Drawing.Color.Red;
            this.Master.Message = "Author was NOT successfully added. Please report the following message to Dr. Robert E. Beasley (rbeasley@franklincollege.edu): " + e.Exception.Message;
            e.KeepInInsertMode = true;
            e.ExceptionHandled = true;

        }
    }

    protected void forFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        // Add code here.
        // Make sure the database call was successful.
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                // Set the message.
                this.Master.MessageForeColor = System.Drawing.Color.Green;
                this.Master.Message = "Author successfully modified.";
            }
            else
            {
                // Set the message. (Concurrency violation.)
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "Author was NOT successfully modified. Another user has just updated this data.Please select another option.";
                e.KeepInEditMode = true;
            }

            // Refresh the page data.
            String strSelectedValue;
            strSelectedValue = ddlAuthor.SelectedValue;
            ddlAuthor.DataBind();
            ddlAuthor.SelectedValue = strSelectedValue;
            forFormView.DataBind();
        }
        else
        {
            // Set the message. (Generic database problem.)
            this.Master.MessageForeColor = System.Drawing.Color.Red;
            this.Master.Message = "Author was NOT successfully modified. Please report the following message to Dr.Robert E. Beasley (rbeasley@franklincollege.edu): " + e.Exception.Message;
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
        }
    }

    protected void forFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        // Add code here.
        // Make sure the database call was successful.
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
            {
                // Set the message.
                this.Master.MessageForeColor = System.Drawing.Color.Green;
                this.Master.Message = "Author successfully deleted.";
            }
            else
            {
                // Set the message. (Concurrency violation.)
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "Author was NOT successfully deleted. Another user has just deleted this data. Please select another option.";          
            }
            // Refresh the page data.
            ddlAuthor.DataBind();
            forFormView.DataBind();
        }
        else
        {
            if (((SqlException)e.Exception).Number.Equals(547))
            {
                // Set the message. (Foreign key constraint problem.)
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "Author was NOT successfully deleted. To delete this author, you must first delete all its associated papers.";
                e.ExceptionHandled = true;
            }
            else
            {
                // Set the message. (Generic database problem.)
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "Author was NOT successfully deleted. Please report the following message to Dr. Robert E. Beasley (rbeasley@franklincollege.edu): " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
        }
    }

    protected void forFormView_PreRender(object sender, EventArgs e)
    {

        // Set the focus.
        if (forFormView.CurrentMode == FormViewMode.Insert || forFormView.CurrentMode == FormViewMode.Edit)
        {
            Control conControl = forFormView.FindControl("txtFirstName");
            if (conControl != null)
            {
                conControl.Focus();
            }
        }

    }

}