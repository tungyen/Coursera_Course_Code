#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <cmath>

using namespace std;
class TSP{

public:

    TSP(string path){

        ifstream in(path);
        in >> cityNum;
        M = (1 << cityNum) - 1;
        distance = vector<vector<double>>(cityNum, vector<double>(cityNum));

        double x;
        double y;
        while(in >> x >> y){
            graph.push_back({x, y});
        }

        in.close();

        for(int i = 0;i<cityNum;i++){
            distance[i][i] = 0.0;
        }

        for(int i = 0;i<cityNum;i++){
            for(int j = i+1;j<cityNum;j++){
                double xDiff = graph[i].first-graph[j].first;
                double yDiff = graph[i].second-graph[j].second;
                double d = sqrt(xDiff*xDiff + yDiff*yDiff);
                dMax = max(dMax, d);
                distance[i][j] = d;
                distance[j][i] = d;
            }
        }
    }

    double minimumCost(int visited, int source){

        if(visited == M){
            return distance[source][0];
        }

        double res = dMax*cityNum;

        for(int i = 1;i<cityNum;i++){
            if(!(visited&(1<<i))){
                double newRes = distance[source][i] + minimumCost(visited|(1<<i), i);
                res = min(res, newRes);
            }
        }
        //cout<<"Current result is: "<<res<<endl;
        return res;
    }


private:
    int cityNum;
    int M;
    double dMax = 0;
    vector<pair<double, double>> graph;
    vector<vector<double>> distance;
};

int main(){

    TSP tsp = TSP("tsp.txt");
    double shortestDis = tsp.minimumCost(1, 0);
    cout<<"The minimim cost of the whole graph is: "<<shortestDis<<endl;

    return 0;
}

// The answer is 26442


