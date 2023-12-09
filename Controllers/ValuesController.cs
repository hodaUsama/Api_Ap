using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CalApi2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET: api/<ValuesController>
        [HttpGet("/hello")]
        public string Hello()
        {
            return "Hello";
        }

        // GET api/<ValuesController>/5
        [HttpGet("/Get")]
        public async Task<string> Get()
        {

            var client = new HttpClient();
            var average = await client.GetStringAsync("https://localhost:7045/average");
            return average;
        }

        // POST api/<ValuesController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ValuesController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ValuesController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
