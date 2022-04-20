#include <iostream>

namespace test {
	struct Test {
		void print() {
			std::cout << "Old (new binary)." << std::endl;
		}
	};
	void dummy_calls() {
		Test t;
		t.print();
	}
};
