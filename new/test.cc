#include "test.h"
#include <iostream>
namespace test {
	struct Test {
		void print() {
			std::cout << "Old (new version binary)." << std::endl;
		}
	};
	namespace v2 {
		void Test::print(int a) {
			std::cout << "New: " << a << std::endl;
		}
	};
};
