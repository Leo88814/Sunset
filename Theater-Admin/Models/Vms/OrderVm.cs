using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Theater_Admin.Models.EFModels;

namespace Theater_Admin.Models.Vms
{
    public class OrderVm
    {
        public  int Id { get; set; }
        public MovieReleaseScheduleIdVm Detail { get; set; }
        public string Member { get; set; } //從memberid轉
        public DateTime OrderDate { get; set; }
        public int TotalTickectCount { get; set; }
        public int TotalAmount { get; set; }
        public  string OrderStatus { get; set; }
        public string OrderNumber { get; set; }
    }
}