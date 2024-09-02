#include <iostream>
#include <map>
using namespace std;

long int pow(long int b, long int exp, long int mod) {
    long int ret = 1;

    while (exp > 0) {
        if ((exp & 1) > 0)
            ret = (ret * b) % mod;
        b = (b * b) % mod;
        exp >>= 1;
    }
    return ret;
}

int calculate_nCr(int n, int r) {
    if (r > n)
        return 0;

    if (n - r > r)
        r = n - r;

    int SPF[n + 1];
    for (int i = 1; i <= n; i++)
        SPF[i] = i;
    for (int i = 4; i <= n; i += 2)
        SPF[i] = 2;
    for (int i = 3; i * i < n + 1; i += 2) {
        if (SPF[i] == i) {
            for (int j = i * i; j < n + 1; j += i)
                if (SPF[j] == j) {
                    SPF[j] = i;
                }
        }
    }

    map<int, int> prime_pow;
    for (int i = r + 1; i < n + 1; i++) {
        int t = i;
        while (t > 1) {
            if (!prime_pow[SPF[t]]) {
                prime_pow[SPF[t]] = 1;
            } else
                prime_pow[SPF[t]]++;
            t /= SPF[t];
        }
    }

    for (int i = 1; i < n - r + 1; i++) {
        int t = i;
        while (t > 1) {
            prime_pow[SPF[t]]--;
            t /= SPF[t];
        }
    }

    long int ans = 1, mod = 1000000007;
    for (auto it : prime_pow)
        ans = (ans * pow(it.first, prime_pow[it.first], mod)) % mod;
    return (int)ans;
}

int main() {
    int n = 30, r = 2;
    cout << "Value of C(" << n << ", " << r << ") is " << calculate_nCr(n, r) << "\n";
    return 0;
}