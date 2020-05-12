
## 'SMART PTR'

// Smart pointers are class template based and compiler dependent.
```cpp
int main(...) {
  ...
  std::smart_pointer<Foo> ptr = ...; .................................. // Notice the class template <Foo>
  // ptr->doSomething();
  // std::cout << (*ptr) << endl;
  ... ................................................................. // Pointer is auto deleted when it is no longer needed
}
```
