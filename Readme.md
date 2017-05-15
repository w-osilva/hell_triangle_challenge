# Hell Triangle - Challenge

Given a triangle of numbers, find the maximum total from top to bottom
Example:
```
   6
  3 5
 9 7 1
4 6 8 4
```

In this triangle the maximum total is 6 + 5 + 7 + 8 = 26

An element can only be summed with one of the two nearest elements in the next row.  
So the element 3 in row 2 can be summed with 9 and 7, but not with 1

Choose the programming language you want… let us know about why is that your choice.  
Besides the solution itself, write an automated test for your code (using a known framework
or just another function/method).  

Your code will receive an (multidimensional) array as input.
The triangle from above would be:
example = [[6],[3,5],[9,7,1],[4,6,8,4]].  

We are interested in your solution considering:
1. Correctness;
2. Readability;
3. The automated test;
4. Execution time;



## About resolution
  
### Language choice
I used Ruby ​​because I'm more familiar and because it's the language I like to work with.

### Dependencies
* ruby (2.2 or higher)
* bundler
* rspec

### How to run this solution?

Clone this repository
```
git clone https://github.com/w-osilva/hell_triangle_challenge.git
```

Run bundler to get dependencies
```
bundle install
```

Running the solution
```
ruby hell_triangle.rb
```

Running test
```
rspec
```
