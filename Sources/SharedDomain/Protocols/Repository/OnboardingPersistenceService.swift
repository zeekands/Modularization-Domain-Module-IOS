//
//  OnboardingPersistenceService.swift
//  SharedDomain
//
//  Created by zeekands on 24/08/25.
//


public protocol OnboardingPersistenceService {
  func hasSeenOnboarding() -> Bool
  func markOnboardingAsSeen()
}
