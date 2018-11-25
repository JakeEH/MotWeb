using System.Web.Configuration;

//namespace MotWeb.Base
//{
    public abstract class BasePage : System.Web.UI.Page
    {
       public class Configuration
        {
            public static string APIKey = WebConfigurationManager.AppSettings["APIKey"];
            public static string URL = "https://beta.check-mot.service.gov.uk/trade/vehicles/mot-tests";
    }

      public  abstract void DisplayForm();
       
    }
//}