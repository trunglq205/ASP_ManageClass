﻿using System.Web;
using System.Web.Mvc;

namespace BTL_Nhom10_ASP
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
