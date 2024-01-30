class solution:
    def unique_subsets(v,i,subset,result):
        if (len(subset) != 0):
            if (subset not in result):
                result.append(subset[:])
        for j in range(i, len(v)):
            subset.append(v[j])
            solution.unique_subsets(v, j + 1, subset, result)
            subset.pop()

    def solve(a):
        result,subset,res = [],[],[]
        solution.unique_subsets(a, 0, subset, result)
        for i in range(len(result)):
            res.append(list(result[i]))
        return res


print(solution.solve([2,3,4]))


