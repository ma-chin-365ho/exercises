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
    int a, b;
    cin >> a >> b;
    
    if (((a * b) % 2) == 0) {
        cout << "Even";
    } else {
        cout << "Odd";
    }
    
    return 0;
}
