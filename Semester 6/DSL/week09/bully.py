def bullyAlgo(initNode, superior):
    for i in range(initNode+1, numNodes):
        print(f"Election message from {initNode} to {i}")
        if i not in superior:
            superior.append(i)
    for i in range(1, len(superior)):
        print(f"OK message from {superior[i]} to {initNode}")
    superior.remove(superior[0])
    if len(superior) == 1:
        return superior[0]
    return bullyAlgo(superior[0], superior)

numNodes = int(input('Enter number of nodes: '))
initiatorNode = int(input('Enter initiator node id: '))
newCoordinator = bullyAlgo(initiatorNode, [initiatorNode])
for i in range(0, newCoordinator):
    print(f"Coordinator message from {newCoordinator} to {i}")