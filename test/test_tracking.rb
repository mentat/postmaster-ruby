# -*- coding: utf-8 -*-
require 'test/unit'
require 'postmaster'
require 'rubygems'
require 'shoulda'
require 'mocha'
require 'rest-client'
require 'cgi'
require 'uri'

class TestTrackingRuby < Test::Unit::TestCase
  include Mocha
 
  context "Tracking" do

    should "return data" do
      result = Postmaster::Tracking.track('1ZW470V80310800043')
      
      assert_instance_of(Postmaster::Tracking, result);
      assert(result.keys.include?(:status))
      assert(result.keys.include?(:history))
      assert(!result.history.empty?)
      assert_instance_of(Postmaster::TrackingHistory, result.history[0])
    end

  end
end
