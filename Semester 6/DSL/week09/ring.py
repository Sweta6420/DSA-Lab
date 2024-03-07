numNodes = int(input('Enter number of nodes: '))
initNode = int(input('Enter initiator node id: '))
failedCoordinator = int(input('Enter failed coordinator node id: '))

activeList = [initNode]

i = (initNode+1)%numNodes
while i != initNode:
    if i != failedCoordinator:
        activeList.append(i)
        print(activeList)
    i = (i+1)%numNodes

coord = activeList[0]

for i in range(1, len(activeList)):
    if activeList[i] > coord:
        coord = activeList[i]

print(f'Coordinator Message from {initNode} to [', end=' ')
for i in range(len(activeList)):
    if i!=initNode:
        print(i,end=',')
print(f'] stating {coord} as new coordinator.')
