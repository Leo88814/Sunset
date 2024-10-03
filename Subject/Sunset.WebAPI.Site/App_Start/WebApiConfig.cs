using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace Sunset.WebAPI.Site
{
	public static class WebApiConfig
	{
		public static void Register(HttpConfiguration config)
		{
			// 設定 JSON 序列化使屬性名稱為駝峰式命名
			config.Formatters.JsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
			config.Formatters.JsonFormatter.SerializerSettings.Formatting = Newtonsoft.Json.Formatting.Indented;
			
			// Remove the XML formatter
			config.Formatters.Remove(config.Formatters.XmlFormatter);

			// Web API 設定和服務

			// Web API 路由
			config.MapHttpAttributeRoutes();

			config.Routes.MapHttpRoute(
				name: "DefaultApi",
				routeTemplate: "api/{controller}/{id}",
				defaults: new { id = RouteParameter.Optional }
			);
		}
	}
}
