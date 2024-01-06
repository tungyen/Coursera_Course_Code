#include <iostream>
#include <vector>
#include <string>
#include <fstream>

using namespace std;

class APSP{

public:

    APSP(string path){

        ifstream in(path);
        in >> V;
        in >> E;
        graph = vector<vector<int>>(V, vector<int>(V, INT_MAX));
        for(int i = 0;i<V;i++){
            graph[i][i] = 0;
        }

        int u;
        int v;
        int length;
        while(in >> u >> v >> length){
            graph[u-1][v-1] = length;
        }
    }

    int shortestPath(){

        for(int k = 0;k<V;k++){
            for(int i = 0;i<V;i++){
                for(int j = 0;j<V;j++){
                    if(graph[i][k] == INT_MAX || graph[k][j] == INT_MAX){
                        continue;
                    }
                    else if(graph[i][k]+graph[k][j] < graph[i][j]){
                        graph[i][j] = graph[i][k]+graph[k][j];
                    }
                }
            }
        }

        for(int i = 0;i<V;i++){
            if(graph[i][i] < 0){
                return -1;
            }
        }

        int shortest = INT_MAX;

        for(int i = 0;i<V;i++){
            for(int j = 0;j<V;j++){
                if(graph[i][j] < shortest){
                    shortest = graph[i][j];
                }
            }
        }
        return shortest;
    }

private:
    int V;
    int E;
    vector<vector<int>> graph;
};

int main(){

    vector<string> graphName = {"g1.txt", "g2.txt", "g3.txt"};

    for(string name:graphName){
        APSP apsp = APSP(name);
        int shortestDistance = apsp.shortestPath();
        cout<<"The shortest path is: "<<shortestDistance<<endl;
    }

    return 0;
}

// The answer is -19

