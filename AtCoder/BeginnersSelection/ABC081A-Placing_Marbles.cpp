//
//  ABC086A-Product.cpp
//  AtCoder
//
//  Created by 佐藤優成 on 2022/01/26.
//

#include<iostream>
using namespace std;
int main()
{
    int s;
    int s1;
    int s2;
    int s3;
    int cnt_b;

    cin >> s;

    s1 = s / 100;
    s2 = (s % 100) / 10;
    s3 = (s % 10);

    cnt_b = s1 + s2 + s3;

    cout << cnt_b;

    return 0;
}
