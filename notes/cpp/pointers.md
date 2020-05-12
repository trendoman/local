<!-- SMART PTR ============================================= -->


## SMART PTR

Smart pointers are class template based and compiler dependent.

```cpp
int main(...) {
  ...
  std::smart_pointer<Foo> ptr = ...; .... // Notice the class template <Foo>
  // ptr->doSomething();
  // std::cout << (*ptr) << endl;
  ... ................................... // Pointer is auto deleted when it is no longer needed
}
```



<!-- UNIQUE PTR ============================================ -->

## UNIQUE PTR

# TLDR

  // Use them as often as you can. When needed switch to shared_ptr.

  // make_unique() is available since C++14.
  // Employee* anEmployee = new Employee; ............................. // no
  auto anEmployee = std::make_unique<Employee>(); ..................... // yes

  #include <memory>
  ...
  class Foo {
    private:
      int data;

    public:
      Foo()
        : data{0}
      {
        std::cout << "Foo::constructor (" << data << ")" << endl;
      }

      Foo(int data)
        : data{data}
      {
        std::cout << "Foo::constructor (" << data << ")" << endl;
      }

      int getData()
      {
        return data;
      }

      ~Foo()
      {
        std::cout << "Foo::destructor (" << data << ")";
      }
  }

  int main(...)
  {
    Foo f1 {1}; .................................. // Foo::constructor (1) -> Foo::destructor (1) ... // Stack based variable; auto cleared

    Foo *f2 = new Foo(2); ........................ // Foo::constructor (2) ... Heap based pointer; stays in memory since it was not cleared. Need to call: delete f2; to delete it.

    auto f3 = make_unique<Foo>(3); ............... // Foo::constructor (3) -> Foo::destructor (3) ... // Smart pointer is auto cleared from memory when out of scope

    std::unique_ptr<Foo> f4 { new Foo(4) }; ...... // // Foo::constructor (4) -> Foo::destructor (4)

    std::unique_ptr<Foo> f5;
    f5 = f4; ..................................... // no Error: cannot copy unique_ptr
    f5 = std::move(f4); .......................... // yes
    if (! f4) { .................................. // Runs because the f4 was moved into f5 and f5 is now the owner of that value
      std::cout << "f4 is nullptr";
    }

    std::unique_ptr<Account> a1 = std::make_unique<AccountSavings>("...", "...", "..."); ... // The type of the pointer is Account - the super class - but it holds an AccountSavings type - which is a sub class
    std::unique_ptr<Account> a2 = std::make_unique<AccountMain>("...");
    std::cout << "Account " << *a2 << " contains amount " << a2->getAmount();

    return 0;
  }

  // To avoid common memory problems, you should use smart pointers instead of normal naked C-style pointers.
  // Smart pointers automatically deallocate memory when the smart pointer object goes out of scope, for example when the function has finished executing.

  // There are three smart pointer types in C++: std::unique_ptr, std::shared_ptr and std::weak_ptr,
  // all defned in the <memory> header. The unique_ptr is analogous to an ordinary pointer, except
  // that it will automatically free the memory or resource when the unique_ptr goes out of scope or is
  // deleted. A unique_ptr has sole ownership of the object pointed to. One advantage of the unique_
  // ptr is that it simplifes coding where storage must be freed when an exceptional situation occurs.
  // When the smart pointer variable leaves its scope, the storage is automatically freed. You can also
  // store a C-style array in a unique_ptr. Use std::make_unique<>() to create a unique_ptr.
  // For example, instead of writing the following:

# via make_unique ... // C++14

      // make_unique() is available since C++14.

      // #include "memory"
      // Employee* anEmployee = new Employee; ............................. // no
      auto p1                 = std::make_unique<Player>("..."); ........ // yes
      unique_ptr<int> i1      = make_unique<int>(1); .................... // Holds unique_ptr to int
      unique_ptr<Account> a1  = make_unique<Account>("Lisa Ann", 39); ... // Holds unique_ptr to Account

      unique_ptr<vector<shared_ptr<Foo>>> getUniquePointer() ............ // Can be replaced by the compiler friendly: auto getUniquePointer() {...}
      {
        unique_ptr<vector<shared_ptr<Foo>>> u = make_unique<vector<shared_ptr<Foo>>>(); ... // "u" now contains a unique_ptr to a vector object
        ...
        return u;
      }

      void push_back(vector<shared_ptr<Foo>> &vec, int value)
      {
        ...
        shared_ptr<Foo> f = make_shared<Foo>(value); .................... // Build the shared_ptr
        vec.push_back(f); ............................................... // Push it to the vector reference
      }

      void display(const vector<shared_ptr<Foo>> &vec)
      {
        for (const auto &v : vec)
        {
          cout << v.get_data() << endl;
        }
      }

      int main(...)
      {
        // unique_ptr<vector<shared_ptr<Foo>>> u = getUniquePointer();
        push_back(*u, 1);
        push_back(*u, 2);
        push_back(*u, 3);

        display(*u);
      }

# via unique_ptr

      // Points to object of type T on the HEAP. Very simple and efficient. Useful in small blocks of code with short longevity.
      // Unique means there can be only one such pointer to resource T on the heap.

      // Cannot be copied or assigned (owns what it points to). Can be moved.

      // If your compiler is not yet C++14 compliant you can make your unique_ptr as follows. Note that you now have to specify the type, Employee, twice:
      std::unique_ptr<Employee> e1(new Employee);

      // unique_ptr is a generic smart pointer that can point to any kind of memory.
      // That’s why it is a template. Templates require the angle brackets to specify the template parameters. Between the brackets you have to specify the type of memory you want your unique_ptr to point to.

      STD TYPES

        #include "memory"
        ...
        void bar {
          unique_ptr<int> i1 { new int{100} };
          cout << *i1 << endl; ... // 100
          *i1 = 200;
          cout << *i1 << endl; ... // 200
          ...
          i1.get() ...................... // Returns the raw pointer
          i1.reset() .................... // The pointer becomes a nullptr
          if (i1) {...} ................. // Does not execute because of i1.reset() which makes the pointer non-initialized
        } ................................................................... // When the block ends the pointer is destroyed

      CUSTOM TYPES

        #include "memory"
        ...
        void foo() {
          unique_ptr<Account> acc { new Account{"Lisa Ann"} };
          cout << *acc << endl; .................... // Display account object
          acc->deposit(1000); ...................... // The pointer allows access to object methods
          acc->withdraw(500);
          ...
          // Auto deleted once foo() returns
        }SMART

# NO COPY

      int main(...)
      {
        std::unique_ptr<Foo> f0 { new Foo(0) }; ........................... // Foo::constructor (1) -> Foo::destructor (1)

        std::unique_ptr<Foo> f1;
        f1 = f0; .......................................................... // no Error: cannot copy unique_ptr
        f1 = std::move(f0); ............................................... // yes
        if (! f1) { ....................................................... // Runs because the f4 was moved into f1 and f1 is now the owner of that value
          std::cout << "f1 is nullptr";
        }

        return 0;
      }

# MOVE OPERATION

      {
        vector<unique_ptr<int>> vec;
        unique_ptr<int> ptr { new int{3} };
        vec.push_back(ptr); ............................................. // Error: copy not allowed. It would need a copy of the object but unique_ptr objects are unique.
        vec.push_back(move(ptr)); ....................................... // Vector now owns the pointer
      }

# LISTS

      int main(...)
      {
        ...
        std::vector<std::unique_ptr<Account>> accounts;

        accounts.push_back( std::make_unique<AccountChecking>("...", "...", "...") ); ... // Because the unique_ptr is not a variable it can be directly owned by the vector
        accounts.push_back( std::make_unique<AccountSavings>("...") );
        accounts.push_back( std::make_unique<AccountTrust>("...") );

        for (const auto &a : accounts) { .................................. // Use reference because copying is not available
          std::cout << *a;
        }

        for (auto a : accounts) { ......................................... // Error: Cannot copy unique_ptr
          std::cout << *a;
        }

        return 0;
      }



<!-- SHARED PTR ============================================ -->

## SHARED PTR'

    // shared_ptr allows for shared or distributed “ownership” of heap objects. Each time a shared_ptr is assigned, a reference count is incremented indicating there is one more “owner” of the data.
    // When a shared_ptr goes out of scope, the reference count is decremented. When the reference count goes to zero it means there is no longer any owner of the data, and the object referenced by the pointer is freed.
    // You cannot store an array in a shared_ptr.

    TLDR

      // Points to objects of type T. It is not unique, many shared_ptr can point to the same object on the heap.
      // Can be assigned and copied. Can be moved. Cannot store array.

      int main(...)
      {
        shared_ptr<int> foo{ new int{1} };
        // cout << *foo << endl; ... // 1
        // *foo = 2;
        // cout << *foo << endl; ... // 2
      }

    via make_shared

      // More efficent. Several pointers can point to the same resource or object on the heap. When use_count becomes 0 the heap object is deallocated.
      #include "memory"
      int main(...)
      {
        ...
        shared_ptr<Bar> bar = make_shared<Bar>(..., ..., ...); .......... // The bar instance is located on the stack. Invokes the 3 argument constructor of class Bar. use_count is 1
        // cout << *bar << endl; ... // Bar
        // bar->doX();

        shared_ptr<Bar> b1 { bar }; ..................................... // use_count is 2
        shared_ptr<Bar> b2;
        b2 = b1; ........................................................ // use_count is 3
      }

    via shared_ptr

      #include "memory"
      int main(...)
      {
        ...
        shared_ptr<Bar> bar{ new Bar{"..."} }; .......................... // The bar instance is located on the heap
        // cout << *bar << endl; ... // Bar
        // bar->doX();
      }

    OBJECT METHODS

      // Points to objects of type T. It is not unique, many shared_ptr can point to the same object on the heap.
      // Can be assigned and copied. Can be moved. Cannot store array.

      int main(...)
      {
        ...
        shared_ptr<Bar> bar{ new Bar{"..."} };
        // cout << *bar << endl; ... // Bar
        bar->doX();
        bar->doY();
        bar->doZ();
      }

    LISTS

      int main(...)
      {
        ...
        vector<shared_ptr<int>> vec;
        // shared_ptr<int> nin { new int{9} };
        // shared_ptr<int> eig { new int{8} };
        // shared_ptr<int> sev { new int{7} };
        vec.push_back( nin ); ........................................... // Auto invokes copy constructor; this is allowed
        vec.push_back( eig );
        vec.push_back( sev );
        cout << nin.use_count() << endl; ................................ // 2 (one in variable "nin", and one in variable "vec")

        vector<shared_ptr<Account>> vec;
        // shared_ptr<Account> am { new Account{...} };
        // shared_ptr<Account> bn { new Account{...} };
        // shared_ptr<Account> co { new Account{...} };
        // vec.push_back( am ); ........................................... // Auto invokes copy constructor; this is allowed
        // vec.push_back( bn );
        // vec.push_back( co );

        for (const int &item : vec) {
          cout << item << item.use_count();
        }
      }

    REFERENCE COUNTING

      // It is not unique, many shared_ptr can point to the same object on the heap.

      int main(...)
      {
        shared_ptr<int> foo{ new int{1} };
        // cout << foo.use_count() << endl; ........................,,,,, // 1

        shared_ptr<int> bar{ foo }; ................................,,,,, // Shared ownership; invokes the copy constructor of foo
        // cout << foo.use_count() << endl; ..................,,,,,...... // 2

        foo.reset(); .................................................... // foo is nullptr
        // cout << foo.use_count() << endl; ..................,,,,,...... // 0 Its use_count is now zero
        // cout << bar.use_count() << endl; ..................,,,,,...... // 1 However bar is still available
      }



<!-- WEAK PTR ============================================== -->
## WEAK PTR

  // You can use weak_ptr to observe a shared_ptr without incrementing or decrementing the reference count of the linked shared_ptr.
  // Used to prevent strong reference cycles which could prevent objects from being deleted.

  TLDR

    // Prevent cyclic referencing: A refers B and B refers A
    //    ... A ...............      ... B ...............
    //    ... shared_ptr<B> ...      ... shared_ptr<A> ...
    class Foo {
      private:
        weak_ptr<Baz> baz;
        ...
      public:
        void setBaz(shared_ptr<Baz> &baz)
        {
          this->baz = baz; .............................................. // weak_ptr are always created from shared_ptr
        }
    }

    int main(...)
    {
      // unique_ptr<Foo> foo = make_unique<Foo>();
      // shared_ptr<Bar> bar = make_shared<Bar>(..., ..., ...);
      foo.setBar(bar);
    }
