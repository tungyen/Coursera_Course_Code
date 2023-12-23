#include <iostream>
#include <vector>
#include <fstream>
#include <unordered_map>
#include <algorithm>

using namespace std;

class twoSum{

public:

    twoSum(string path){

        ifstream in(path);
        long long val;
        while(in >> val){
            data.push_back(val);
        }
        sort(data.begin(), data.end());
    }

    int getDistinctTarget(){

        int start = 0;
        int end = data.size()-1;
        int total = 0;

        while(start < end){

            if(data[start]+data[end]>high){
                end--;
            }
            else if(data[start]+data[end]<low){
                start++;
            }
            else{
                for(int pos = start+1;pos<=end;pos++){
                    long long sum = data[start]+data[pos];
                    if(data[start] == data[pos]){
                        continue;
                    }
                    if(sum>high){
                        break;
                    }
                    if(sum>=low){
                        if(!mp.count(sum)){
                            total++;
                            mp[sum]++;
                        }
                    }
                }
                start++;
            }
        }
        return total;
    }

private:

    vector<long long> data;
    unordered_map<long long, int> mp;
    int low = -10000;
    int high = 10000;

};

int main(){

    twoSum ts = twoSum("2sum.txt");
    int ans = ts.getDistinctTarget();
    cout<<"The total distinct sum is: "<<ans<<endl;
    return 0;
}
