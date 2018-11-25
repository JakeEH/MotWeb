using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net;
using System.IO;
using RestSharp;
using Newtonsoft.Json.Linq;


public partial class _Default : BasePage
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DisplayForm();
        }
    }

    /// <summary>
    /// Set up the page 
    /// </summary>
    public override void DisplayForm()
    {

    }

    protected void btnSubmitReg_Click(object sender, EventArgs e)
    {
        SubmitReg();

    }

    protected void rptMOT_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label lblComment;
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Vehicle.MotTest motTest = (Vehicle.MotTest)e.Item.DataItem;
            lblComment = (Label)e.Item.FindControl("lblCommentText");
            if (motTest.rfrAndComments.Count > 0)
            {
                lblComment.Text = motTest.rfrAndComments[0].Text;
            }


        }
    }

    /// <summary>
    /// Processes input reg
    /// </summary>
    private void SubmitReg()
    {
        IRestResponse vehicleResponse;
        Vehicle vehicle;
        vehicleResponse = APIGet(txtReg.Text);
        if (vehicleResponse.IsSuccessful)
        {
            vehicle = DeserializeResponse(vehicleResponse);

            PopulateForm(vehicle);
            plcTests.Visible = true;
            rptMOT.DataSource = vehicle.motTests.Skip(1);//first item is already displayed in the top
            rptMOT.DataBind();
        }

    }

    /// <summary>
    /// call the data from the API, using the mandatory headers, and user supplied reg
    /// </summary>
    /// <param name="regNumber"></param>
    /// <returns></returns>
    private IRestResponse APIGet(string regNumber)
    {
        var client = new RestClient(Configuration.URL);
        var request = new RestRequest(Method.GET);
        request.AddHeader("Accept", "application/json+v4");
        request.AddHeader("x-api-key", Configuration.APIKey);
        request.AddHeader("description", "");

        request.AddQueryParameter("registration", regNumber);
        IRestResponse response = client.Execute(request);
        return response;

    }

    /// <summary>
    /// deserialize the json in an object, return the first one in the list 
    /// </summary>
    /// <param name="vehicleResponse"></param>
    /// <returns></returns>
    private Vehicle DeserializeResponse(IRestResponse vehicleResponse)
    {
        List<Vehicle> vehicleDeserialize = (List<Vehicle>)Newtonsoft.Json.JsonConvert.DeserializeObject(vehicleResponse.Content, typeof(List<Vehicle>));
        return vehicleDeserialize[0];

    }

    /// <summary>
    /// populates text boxes on screen with data from the object
    /// </summary>
    /// <param name="vehicle"></param>
    private void PopulateForm(Vehicle vehicle)
    {
        txtColour.Text = vehicle.primaryColour;
        txtMake.Text = vehicle.make;
        txtModel.Text = vehicle.model;
        //first item is the latest
        txtMOTExpiryDate.Text = vehicle.motTests[0].expiryDate.ToString();
        txtMileageatlastMOT.Text = vehicle.motTests[0].odometerValue;
        txtDaysRemaining.Text = (Convert.ToDateTime(vehicle.motTests[0].expiryDate) - DateTime.Now).Days.ToString();

    }


}
