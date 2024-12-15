using BusinessCardManagerAPI.Data;
using BusinessCardManagerAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CsvHelper;
using System.Globalization;
using System.Xml.Serialization;
using System.IO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BusinessCardManagerAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BusinessCardController : ControllerBase
    {
        private readonly AppDbContext _context;

        public BusinessCardController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var cards = await _context.BusinessCards.ToListAsync();
            return Ok(cards);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] BusinessCard card)
        {
            if (card == null)
                return BadRequest("Invalid data.");

            await _context.BusinessCards.AddAsync(card);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = card.Id }, card);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var card = await _context.BusinessCards.FindAsync(id);
            if (card == null)
                return NotFound();

            return Ok(card);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var card = await _context.BusinessCards.FindAsync(id);
            if (card == null)
                return NotFound();

            _context.BusinessCards.Remove(card);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpGet("export")]
        public async Task<IActionResult> Export(string format)
        {
            var cards = await _context.BusinessCards.ToListAsync();

            if (format.ToLower() == "csv")
            {
                var memoryStream = new MemoryStream();
                using (var writer = new StreamWriter(memoryStream))
                using (var csv = new CsvWriter(writer, CultureInfo.InvariantCulture))
                {
                    csv.WriteRecords(cards);
                }
                memoryStream.Position = 0;
                return File(memoryStream, "text/csv", "BusinessCards.csv");
            }
            else if (format.ToLower() == "xml")
            {
                var serializer = new XmlSerializer(typeof(List<BusinessCard>));
                var memoryStream = new MemoryStream();
                serializer.Serialize(memoryStream, cards);
                memoryStream.Position = 0;
                return File(memoryStream, "application/xml", "BusinessCards.xml");
            }
            else
            {
                return BadRequest("Unsupported format. Use 'csv' or 'xml'.");
            }
        }
    }
}
