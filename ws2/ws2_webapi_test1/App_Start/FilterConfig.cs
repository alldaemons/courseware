﻿using System.Web;
using System.Web.Mvc;

namespace ws2_webapi_test1
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
