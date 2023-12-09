#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <cstdlib>

using namespace std;

int main(int argc, char** argv) {
	ifstream in;
	in.open("QuickSort.txt", ios::in);
	
	vector<int> lists;
	int element;
	while(in>>element){
		lists.push_back(element);
	}
	
	return 0;
}
