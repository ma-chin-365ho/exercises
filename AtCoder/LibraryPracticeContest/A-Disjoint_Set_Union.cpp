//
//  A-Disjoint_Set_Union.cpp
//  AtCoder
//
//  Created by 佐藤優成 on 2022/01/26.
//
#include<iostream>
#include<vector>
using namespace std;

int main()
{
    int N, Q, t, u, v;
    cin >> N >> Q;

    vector<int> node_gid(200000); 
    int ans[200000] = {0};
    int i_ans = 0;
    int gid = 1;
    int u_gid;
    int v_gid;
    int n, q, i_a;


    for (q = 0; q < Q; q++){
        cin >> t >> u >> v;

        if (t == 1)
        {
            if (node_gid[u] != 0 && node_gid[v] != 0 && node_gid[u] == node_gid[v]) {
                // ans[i_ans] = 1;
                cout << 1 << endl;
                ++i_ans;
            } else {
                // ans[i_ans] = 0;
                cout << 0 << endl;
                ++i_ans;
            }
        }
        else if (t == 0)
        {
            if (u != v) {
                if ( node_gid[u] == 0 && node_gid[v] == 0 )
                {
                    // NewGroup
                    node_gid[u] = gid;
                    node_gid[v] = gid;
                    gid++;
                }
                else if (node_gid[u] != 0 && node_gid[v] == 0)
                {
                    // JoinUGroup
                    node_gid[v] = node_gid[u];
                }
                else if (node_gid[u] == 0 && node_gid[v] != 0)
                {
                    // JoinVGroup
                    node_gid[u] = node_gid[v];
                }
                else if (node_gid[u] != 0 && node_gid[v] != 0 && node_gid[u] == node_gid[v])
                {
                    // NoChange
                }
                else if (node_gid[u] != 0 && node_gid[v] != 0 && node_gid[u] != node_gid[v])
                {
                    // UnionUVGroup
                    u_gid = node_gid[u];
                    v_gid = node_gid[v];

                    for (n = 0; n < N; n++)
                    {
                        if (node_gid[n] == u_gid)
                        {
                            node_gid[n] = v_gid;
                        }
                    }
                }
            }
        }
    }

    /*
    for (i_a = 0; i_a < i_ans; ++i_a)
    {
        cout << ans[i_a] << endl;
    }
    */

    return 0;
}

