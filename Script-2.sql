CREATE TABLE book(book_id    number(5), 
                  title      varchar2(50),
                  author     varchar2(10),
                  pub_date   DATE);
SELECT * FROM book;

DROP TABLE book;
DROP TABLE author;
CREATE table author(
      author_id     number(10),
      author_name   varchar2(100) NOT null,
      author_desc   varchar2(500),
PRIMARY key(author_id)
);
SELECT * FROM author;
CREATE TABLE book(
   book_id    number(10), 
   title      varchar2(100) NOT null,
   pubs     varchar2(100),
   pub_date   DATE,
   author_id number(10),
   PRIMARY key(book_id),
   CONSTRAINT c_book_fk FOREIGN key(author_id)
   REFERENCES author(author_id)
);
INSERT INTO author(author_id, AUTHOR_NAME) 
values(1, '이문열');
UPDATE AUTHOR 
SET author_name = '기안84',
    author_desc = '웹툰작가'
WHERE author_id=2;