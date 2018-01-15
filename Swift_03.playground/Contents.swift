var stateMan = (pushUpsCount:15, pullUpsCount:20, sitUpsCount:25)

print("Man's state:")
print(stateMan)

print("push ups count = \(stateMan.pushUpsCount)\npull ups count = \(stateMan.1)\nsit ups count = \(stateMan.sitUpsCount)")

var stateWoman = (pushUpsCount:12, pullUpsCount:2, sitUpsCount:45)

print("\nWoman's state:")
print(stateWoman)

let tempPushUpsCount = stateMan.pushUpsCount
let tempPullUpsCount = stateMan.pullUpsCount
let tempSitUpsCount = stateMan.sitUpsCount

stateMan.0 = stateWoman.0
stateMan.1 = stateWoman.1
stateMan.2 = stateWoman.2

stateWoman.pushUpsCount = tempPushUpsCount
stateWoman.pullUpsCount = tempPullUpsCount
stateWoman.sitUpsCount = tempSitUpsCount

print("\nMan's state:")
print("push ups count = \(stateMan.pushUpsCount)\npull ups count = \(stateMan.1)\nsit ups count = \(stateMan.sitUpsCount)")

print("\nWoman's state:")
print("push ups count = \(stateWoman.pushUpsCount)\npull ups count = \(stateWoman.1)\nsit ups count = \(stateWoman.sitUpsCount)\n")

let diffPush = stateMan.pushUpsCount - stateWoman.pushUpsCount
let diffPull = stateMan.pullUpsCount - stateWoman.pullUpsCount
let diffSit = stateMan.sitUpsCount - stateWoman.sitUpsCount

let different = (diffPush, diffPull, diffSit)

if diffPush > 0 {
    print("The man does more push-ups for \(diffPush)")
} else {
    print("The woman does more push-ups for \(abs(diffPush))")
}

if diffPull > 0 {
    print("The man does more pull-ups for \(diffPull)")
} else {
    print("The woman does more pull-ups for \(abs(diffPull))")
}

if diffSit > 0 {
    print("The man does more sit-ups for \(diffSit)")
} else {
    print("The woman does more pit-ups for \(abs(diffSit))")
}
