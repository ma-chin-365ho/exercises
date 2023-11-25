//
//  ABC086A-Product.cpp
//  AtCoder
//
//  Created by 佐藤優成 on 2022/01/26.
//

#include<iostream>
#include<vector>
#include <algorithm>
using namespace std;

#if 0
int combination(unsigned int m, unsigned int n)
{
    int numerator = 1;
    int denominator = 1;
    int i = 0;
    int i_n = 0;

    if (n == 0 || m < n) {
        return 0;
    }

    for (i = 0; i < n; --i)
    {
        denominator *= m;
        --m;
    }

    for (i_n = n; i_n > 1; --i_n)
    {
        numerator *= i_n;
    }

    return numerator / denominator;
}

vector<int> right_yokan(vector<int> &yokan, int cut_idx)
{
    vector<int> right_yokan;
    for(auto itr = yokan.begin()+cut_idx; itr != yokan.end(); ++itr) {
        right_yokan.push_back(*itr);
    }

    return right_yokan;
}

vector<int> left_yokan(vector<int> &yokan, int cut_idx)
{
    vector<int> left_yokan;

    for (int i = 0; i <= cut_idx; ++i) {
        left_yokan.push_back(yokan[i]);
    }

    return left_yokan;
}

int min_yokan_size(vector<int> &yokan, int max_cut_cnt, int now_cut_cnt, int now_min_size)
{
    if (now_cut_cnt == max_cut_cnt)
    {
        return -1;
    }
    else
    {
        new_yokan = right_yokan(yokan, );
        for () {
            new_l_yokan = left_yokan(new_yokan, );

        }
        ++max_cut_cnt;
        yokan_size = min_yokan_size(new_yokan, max_cut_cnt, max_cut_cnt, now_min_size);
        new_size = accumulate(new_l_yokan.begin(), new_l_yokan.end());
        if (now_min_size > new_size) {
            now_min_size = new_size;
        }
        return new_size
    }
}
#endif

vector< vector<int> > gen_cut_pattern(vector< vector<int> > &cut_patterns, int now_k, int K, int N)
{
#if 0
    cout << "gen_cut_pattern" << endl;
#endif
    if (now_k > K) {
#if 0
        cout << "gen_cut_pattern last" << now_k << endl;
        cout << "cut_patterns.size : " << cut_patterns.size() << endl;
#endif
        return cut_patterns;
    } else {

        vector< vector<int> > new_cut_patterns;
        for (const auto& cut_pattern : cut_patterns)
        {
#if 0
            cout << "for1" << endl;
            cout << "cut_pattern[(now_k-1)-1]+1 : " << cut_pattern[(now_k-1)-1]+1 << endl;
            cout << "N - (K - (now_k+1)) : " << N - (K - (now_k+1)) << endl;
#endif
            
            for (int n = cut_pattern[(now_k-1)-1]+1; n < N - (K - (now_k+1)) -1; ++n){
                vector<int> new_cut_pattern(K);
                for (int k = 1; k < now_k; ++k)
                {
                    new_cut_pattern[k-1] = cut_pattern[k -1];
                }
                new_cut_pattern[now_k-1] = n;

#if 0
                cout << "new_cut_pattern" << endl;
                for (auto debug = new_cut_pattern.begin(); debug != new_cut_pattern.end(); ++debug)
                {
                    cout << *debug << endl;
                }
#endif

                new_cut_patterns.push_back(new_cut_pattern);
            }
        }

        ++now_k;
#if 0
        cout << "new_cut_patterns.size : " << new_cut_patterns.size() << endl;
#endif
        return gen_cut_pattern(new_cut_patterns, now_k, K, N);
    }
}

vector<int> calc_size_yokan_cut(vector<int>& yokan , const vector<int>& cut_pattern, int K, int N)
{
    vector<int> result_sums(K+1);
    int cut_pattern_idx = 0;
    int now_sum = 0;

    for (int n = 0; n < N+1; ++n)
    {
        now_sum += yokan[n];
        if (cut_pattern_idx < K && cut_pattern[cut_pattern_idx] == n) {
            result_sums[cut_pattern_idx] = now_sum;
            now_sum = 0;
            ++cut_pattern_idx;
        }
    }
    result_sums[K] = now_sum;
    
    return result_sums;
}

int main()
{
    int N; // 切れ目
    int L; // 左右の長さ
    int K; // 切る数
    cin >> N >> L;
    cin >> K;

    int i;
    int n;

    vector<int> A(N); // 左からの長さ
    for (i = 0; i < N; ++i)
    {
        cin >> A[i];
    }

    vector<int> B(N+1); // 切れ目ごとの長さ
    B[0] = A[0];
    for (i = 1; i < N; ++i)
    {
        B[i] = A[i] - A[i-1];
    }
    B[N] = L - A[N-1];

#if 0
    cout << "(B)=======================" << endl;
    for (auto debug = B.begin(); debug != B.end(); ++debug)
    {
        cout << *debug << endl;
    }
#endif

    vector< vector<int> > cut_patterns1;
    for (n = 0; n < N - (K - 1); ++n)
    {
        vector<int> new_pattern(K);
        new_pattern[0] = n;
        cut_patterns1.push_back(new_pattern);
    }
    vector< vector<int> >  cut_patterns_all = gen_cut_pattern(cut_patterns1, 2, K, N);

#if 0
    cout << "cut_patterns_all.size : " << cut_patterns_all.size() << endl;
#endif

    vector<int> sums(K);
    int max_min_sums = 0;
    int min_sums = 0;
    for (const auto& cut_pattern : cut_patterns_all)
    {
#if 0
        cout << "=======================" << endl;
        for (auto debug = cut_pattern.begin(); debug != cut_pattern.end(); ++debug)
        {
            cout << *debug << endl;
        }
#endif
        sums = calc_size_yokan_cut(B, cut_pattern,K, N);
#if 0
        cout << "(sums)=======================" << endl;
        for (auto debug = sums.begin(); debug != sums.end(); ++debug)
        {
            cout << *debug << endl;
        }
#endif
        min_sums = *min_element(sums.begin(),sums.end());
#if 0
        cout << "min_sums" << endl;
        cout << min_sums << endl;
#endif
        if (max_min_sums == 0 || max_min_sums < min_sums)
        {
            max_min_sums = min_sums;
        } 
    }
    cout <<  max_min_sums << endl;


#if 0
    pattern_cnt = combination(N, K);
    vector<vector<int>> idx_d(pattern_cnt, K); // 切る切れ目のidx nCk * K
    int min_size = -1;
    for (n = 0; n < N; ++n)
    {
        r_yokan = right_yokan(B, n)
        now_min_size = min_yokan_size()
        if (min_size == -1 || min_size > now_min_size)
        {
            min_size = now_min_size;
        }
    }
#endif

    return 0;
}
