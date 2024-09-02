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
    int n = 5, r = 2;
    cout << "Value of C(" << n << ", " << r << ") is " << calculate_nCr(n, r) << "\n";
    return 0;
}