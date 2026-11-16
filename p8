
a = [[0,1,0],[2,0,0],[3,0,3],[2,1,1]]
m = [[7,5,3],[3,2,2],[9,0,6],[2,2,2]]
v = [3,3,2]
n = [[m[i][j]-a[i][j] for j in range(3)] for i in range(4)]

def safe(a,n,v):
    w = v[:]
    f = [0]*4
    s = []
    for _ in range(4):
        for i in range(4):
            if not f[i] and all(n[i][j]<=w[j] for j in range(3)):
                w = [w[j]+a[i][j] for j in range(3)]
                f[i] = 1
                s.append("P"+str(i))
                break
    return all(f),s

print("Need Matrix:")
for i in range(4): print("P",i,n[i])
print("\nInitial State:",safe(a,n,v))

def request(p,r):
    if any(r[j]>n[p][j] for j in range(3)):
        print("P",p,"Denied: Exceeds Need")
    elif any(r[j]>v[j] for j in range(3)):
        print("P",p,"Denied: Not Available")
    else:
        aa = [x[:] for x in a]
        nn = [x[:] for x in n]
        vv = [v[j]-r[j] for j in range(3)]
        aa[p] = [aa[p][j]+r[j] for j in range(3)]
        nn[p] = [nn[p][j]-r[j] for j in range(3)]
        print("P",p,"Granted" if safe(aa,nn,vv)[0] else "Denied: Unsafe State")

request(1,[1,0,2])
request(0,[0,2,0])
request(2,[4,0,1])
