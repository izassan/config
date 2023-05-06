#include <bits/stdc++.h>

#define L long long
#define V(i) vector<i>
#define A(i, n) array<i, n>
#define M(k, v) map<k, v>
#define T(i) vector<vector<i>>
#define G(i) vector<vector<i>>
#define REP(i, n) for (int i = 0; i < (int)(n); i++)
#define REPI(i, s, n) for (int i = (s); i < (int)(n); i++)
#define RREP(i, n) for (int i = (int)(n); i >= 0; i--)
#define RREPI(i, s, n) for (int i = (int)(n); i < (int)(s); i--)
#define FOREACH(i, o) for(auto i : o)

using namespace std;

template <typename T>
vector<T> input_vector(long long n);
template <typename T>
void output_vector(vector<T> vec, string split="");
template <typename T>
vector<vector<T>> input_table(long long h, long long w);

int main(){
    {{_cursor_}}
    return 0;
}

template <typename T>
vector<vector<T>> input_table(long long h, long long w){
    vector<vector<T>> table(h, vector<T>(w));
    for(long long i=0; i<h; i++){
        for(long long j=0; j<w; j++){
            cin >> table[i][j];
        }
    }
    return table;
}

template <typename T>
vector<T> input_vector(long long n){
    vector<T> vec;
    T tmp;
    for(long long i=0; i < n; i++){
        cin >> tmp;
        vec.push_back(tmp);
    }
    return vec;
}

template <typename T>
void output_vector(vector<T> vec, string split){
    for(long long i=0; i < vec.size()-1; i++){
        cout << vec[i];
        if(split != ""){
            cout << split;
        }else{
            cout << endl;
        }
    }
    cout << vec.back() << endl;
}
