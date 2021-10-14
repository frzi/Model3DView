
/*
 * Euler.swift
 * Created by Freek (github.com/frzi) on 14-10-2021.
 */

import SwiftUI

/// Rotation vector where all elements are of type `Angle`.
///
/// The vector represents Euler angles.
public struct Euler: Equatable {
	public var x: Angle
	public var y: Angle
	public var z: Angle
	
	public init(x: Angle = .radians(0), y: Angle = .radians(0), z: Angle = .radians(0)) {
		self.x = x
		self.y = y
		self.z = z
	}
}	

extension Euler: ExpressibleByArrayLiteral {
	public init(arrayLiteral elements: Angle...) {
		precondition(elements.count == 3)
		self.init(x: elements[0], y: elements[1], z: elements[2])
	}
}

// MARK: - Vector arithemtic conformance.
extension Euler: VectorArithmetic {
	public static func - (lhs: Euler, rhs: Euler) -> Euler {
		Euler(
			x: .radians(lhs.x.radians - rhs.x.radians),
			y: .radians(lhs.y.radians - rhs.y.radians),
			z: .radians(lhs.z.radians - rhs.z.radians)
		)
	}

	public static func + (lhs: Euler, rhs: Euler) -> Euler {
		Euler(
			x: .radians(lhs.x.radians + rhs.x.radians),
			y: .radians(lhs.y.radians + rhs.y.radians),
			z: .radians(lhs.z.radians + rhs.z.radians)
		)
	}

	public mutating func scale(by rhs: Double) {
		x = .radians(x.radians * rhs)
		y = .radians(y.radians * rhs)
		z = .radians(z.radians * rhs)
	}

	public var magnitudeSquared: Double {
		x.radians * x.radians + y.radians * y.radians + z.radians * z.radians
	}

	public static var zero: Euler {
		Euler(x: .radians(0), y: .radians(0), z: .radians(0))
	}
}