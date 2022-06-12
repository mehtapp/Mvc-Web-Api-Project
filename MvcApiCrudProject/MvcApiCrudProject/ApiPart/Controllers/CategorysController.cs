using ApiPart.Models;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace ApiPart.Controllers
{
    public class CategorysController : ApiController
    {
        private CosmeticDBEntities db = new CosmeticDBEntities();

        // GET: api/Categorys
        public IQueryable<Categorys> GetCategorys()
        {
            return db.Categorys;
        }

        // GET: api/Categorys/5
        [ResponseType(typeof(Categorys))]
        public async Task<IHttpActionResult> GetCategorys(int id)
        {
            Categorys categorys = await db.Categorys.FindAsync(id);
            if (categorys == null)
            {
                return NotFound();
            }

            return Ok(categorys);
        }

        // PUT: api/Categorys/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutCategorys(int id, Categorys categorys)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != categorys.CategoryId)
            {
                return BadRequest();
            }

            db.Entry(categorys).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CategorysExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Categorys
        [ResponseType(typeof(Categorys))]
        public async Task<IHttpActionResult> PostCategorys(Categorys categorys)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Categorys.Add(categorys);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = categorys.CategoryId }, categorys);
        }

        // DELETE: api/Categorys/5
        [ResponseType(typeof(Categorys))]
        public async Task<IHttpActionResult> DeleteCategorys(int id)
        {
            Categorys categorys = await db.Categorys.FindAsync(id);
            if (categorys == null)
            {
                return NotFound();
            }

            db.Categorys.Remove(categorys);
            await db.SaveChangesAsync();

            return Ok(categorys);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CategorysExists(int id)
        {
            return db.Categorys.Count(e => e.CategoryId == id) > 0;
        }
    }
}