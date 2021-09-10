using BookStore.Data.Interfaces;
using BookStore.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStore.Data.Repositories
{
    public class BookRepository : IBookRepository
    {
        public List<Book> books = new List<Book>
        {
               new Book{ Id=1, Title="The girl on the train",Author="Haukins",PublicationYear=2010,CallNumber="f Josef"},
               new Book{ Id=2, Title="Story Teller",Author="rabbins",PublicationYear=1998,CallNumber="f Rasi"},
               new Book{ Id=3, Title="The Moon",Author="rakesh",PublicationYear=1999,CallNumber="Ranjith"},
               new Book{ Id=4, Title="Devil on city",Author="ranjith",PublicationYear=2015,CallNumber="Neeraj"}
        };

        public List<Book> GetAllBooks()
        {
           return books;
        }

        public Book GetBook(int id)
        {
           return books.FirstOrDefault(x => x.Id == id);
        }
    }
}
