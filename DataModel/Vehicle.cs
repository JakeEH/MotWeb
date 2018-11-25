﻿using System;
using System.Collections.Generic;

using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

//namespace Model
//{
public class Vehicle
{
    public string registration { get; set; }
    public string make { get; set; }
    public string model { get; set; }
    public string firstUsedDate { get; set; }
    public string fuelType { get; set; }
    public string primaryColour { get; set; }
    public List<MotTest> motTests { get; set; }

    public class MotTest
    {

        public string completedDate { get; set; }
        public string testResult { get; set; }
        public string expiryDate { get; set; }
        public string odometerValue { get; set; }
        public string odometerUnit { get; set; }
        public string motTestNumber { get; set; }
        public string odometerResultType { get; set; }
        public List<RfrAndComment> rfrAndComments { get; set; }
    }

   
    public partial class RfrAndComment
    {
        [JsonProperty("text")]
        public string Text { get; set; }

        [JsonProperty("type")]
        public string Type { get; set; }

        [JsonProperty("dangerous")]
        public bool Dangerous { get; set; }
    }

 //   public enum TypeEnum { Advisory, Fail, Major, Minor, Prs, UserEntered };
}
//}
