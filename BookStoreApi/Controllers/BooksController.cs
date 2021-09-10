using BookStore.Data.Interfaces;
using BookStore.Data.Models;
using BookStore.Data.Repositories;
//using BookStoreApi.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookStoreApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        //    public List<Book> books = new List<Book>
        //{
        //           new Book{ Id=1, Title="The girl on the train",Author="Haukins",PublicationYear=2010,CallNumber="f Josef"},
        //           new Book{ Id=2, Title="Story Teller",Author="rabbins",PublicationYear=1998,CallNumber="f Rasi"},
        //           new Book{ Id=3, Title="The Moon and the sky",Author="rakesh",PublicationYear=1999,CallNumber="Ranjith"},
        //           new Book{ Id=4, Title="Devil on city",Author="ranjith",PublicationYear=2015,CallNumber="Neeraj"}
        //        };

        private BookRepository books = new BookRepository();
        [HttpGet]
    public ActionResult<IEnumerable<Book>>GetAllBooks()
        {
            return books.GetAllBooks();
        }

    [HttpGet("{Id}")]
    public ActionResult<Book> GetBook(int id)
        {
            // var book = books.FirstOrDefault(x => x.Id == id);
            var book = books.GetBook(id);
            if(book==null)
            {
                return NotFound();
            }
            return book;
        }
    }
}
