#include <iostream>
#include <iomanip>
#include <string>
#include <sstream>
#include <functional>


std::string bfmt(bool a) { return a ? "T" : "F"; }


// proposition in two variables
class proposition {
public:
	explicit proposition(std::function<bool(bool, bool)> f) : _f(f) {}
	bool operator()(bool p, bool q) { return _f(p ,q); }
	std::string string_value_of(bool p, bool q) {
		using std::left;
		using std::right;
		using std::setw;

		std::stringstream ss;
		ss << left << setw(3) << bfmt(p)
			<< left << setw(3) << bfmt(q)
			<< right << setw(6) << bfmt(_f(p, q));

		return ss.str();
	}
	std::string string_value_of(int a) {
		return string_value_of(a & 1, a & 2);
	}

private:
	std::function<bool(bool, bool)> _f;
};

int main(int argc, char* argv[]) {
	auto p = proposition([](bool p, bool q){return (p || !q) && q; });
	for (unsigned i = 0; i < 4; ++i) {
		std::cout << p.string_value_of(i) << '\n';
	}
}