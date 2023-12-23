#include <iostream>
#include <vector>
#include <fstream>
#include <queue>

using namespace std;

class MedianMaintenance{

public:

    MedianMaintenance(string path){
        ifstream in(path);
        int x;
        while(in >> x){
            data.push_back(x);
        }
        in.close();
    }

    vector<int> getAllMedian(){

        vector<int> allMedian;
        for(int i = 0;i<data.size();i++){

            int x = data[i];
            int median;

            if(i==0){
                rear.push(x);
                median = x;
            }
            else if(i==1){
                if(x < rear.top()){
                    front.push(x);
                }
                else{
                    front.push(rear.top());
                    rear.pop();
                    rear.push(x);
                }
                median = front.top();
            }
            else{
                int Sr = rear.size();
                int Sf = front.size();

                if(Sr == Sf){
                    if(data[i]<front.top()){
                        rear.push(front.top());
                        front.pop();
                        front.push(data[i]);
                    }
                    else{
                        rear.push(data[i]);
                    }
                }
                else{
                    if(data[i]<rear.top()){
                        front.push(data[i]);
                    }
                    else{
                        front.push(rear.top());
                        rear.pop();
                        rear.push(data[i]);
                    }
                }
                median = rear.size() == front.size() ? front.top() : rear.top();
            }
            allMedian.push_back(median);
        }
        return allMedian;
    }

private:
    vector<int> data;
    priority_queue<int, vector<int>, greater<int>> rear;
    priority_queue<int> front;

};

int main(){

    MedianMaintenance mm = MedianMaintenance("Median.txt");
    vector<int> allMedians = mm.getAllMedian();

    int sum = 0;
    for(int ele:allMedians){
        sum += ele;
    }
    int ans = sum % 10000;
    cout<<"The sum of all median numbers for Median Maintenance is after Mod 10000: "<<ans<<endl;
    return 0;
}
