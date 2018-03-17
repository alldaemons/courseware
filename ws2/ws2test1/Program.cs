using System;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace HttpClientSample
{
    public class Employee
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string contractTypeName { get; set; }
        public int    roleId { get; set; }
        public string RoleName { get; set; }
        public decimal hourlySalary { get; set;  }
        public decimal monthlySalaryice { get; set; }
        
    }

    

    class Program
    {
        static HttpClient client = new HttpClient();
       

        static void ShowProduct(Employee _employee)
        {
            Console.WriteLine($"Name: {_employee.Name}\tHourly Salary: " +
                $"{_employee.hourlySalary}\tRole Name: {_employee.RoleName}");
        }



        static async Task<List<Employee>> GetProductAsync(string path)
        {
            // Employee _employee = null;
            List< Employee> _list_employee = new List<Employee>();
            HttpResponseMessage response = await client.GetAsync(path);
            if (response.IsSuccessStatusCode)
            {
                _list_employee = await response.Content.ReadAsAsync<List<Employee>>();
            }
            return _list_employee;
        }


        static void Main()
        {
            RunAsync().GetAwaiter().GetResult();
        }

        static async Task RunAsync()
        {
            // Update port # in the following line.
            client.BaseAddress = new Uri("http://masglobaltestapi.azurewebsites.net/api/Employees");
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));

            try
            {
                // Create a new _employee object

                List<Employee> _list_employee = new List<Employee>();
                // Get the _employee
                _list_employee = await GetProductAsync(client.BaseAddress.PathAndQuery);
                Console.WriteLine("Reading values:\n");
                foreach (Employee _item_employee in _list_employee)
                {
                    ShowProduct(_item_employee);
                }

            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            Console.ReadLine();
        }
    }
}