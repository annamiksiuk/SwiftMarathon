let firstName = "Ivan"

let lastName = "Sidorov"

let height = 180.2

let weight = 75.6

let age = 25

print("Student name: \(firstName) \(lastName)\nheight = \(height)\nweight = \(weight)\nage = \(age)")

print("range for type UInt8:  \(UInt8.min) ... \(UInt8.max)")
print("range for type UInt16: \(UInt16.min) ... \(UInt16.max)")
print("range for type UInt32: \(UInt32.min) ... \(UInt32.max)")
print("range for type UInt64: \(UInt64.min) ... \(UInt64.max)")
print("range for type UInt:   \(UInt.min) ... \(UInt.max)")

print("range for type Int8:  \(Int8.min) ... \(Int8.max)")
print("range for type Int16: \(Int16.min) ... \(Int16.max)")
print("range for type Int32: \(Int32.min) ... \(Int32.max)")
print("range for type Int64: \(Int64.min) ... \(Int64.max)")
print("range for type Int:   \(Int.min) ... \(Int.max)")
print("range for type Float: \(Float.leastNormalMagnitude) ... \(Float.greatestFiniteMagnitude)")
print("range for type Double:\(Double.leastNormalMagnitude) ... \(Double.greatestFiniteMagnitude)")

let a = 5
let b : Float = 9.6
let c = 12.9
let intSum = a + Int(b) + Int(c)
let floatSum : Float = Float(a) + b + Float(c)
let doubleSum = Double(a) + Double(b) + c

if Double(intSum) < doubleSum {
    print("\nthe result of double type is more precise")
} else {
    print("\nthe result of int type is more precise")
}




