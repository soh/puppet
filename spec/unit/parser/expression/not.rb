#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../../../spec_helper'

describe Puppet::Parser::Expression::Not do
  before :each do
    @scope = Puppet::Parser::Scope.new
    @true_ast = Puppet::Parser::Expression::Boolean.new( :value => true)
    @false_ast = Puppet::Parser::Expression::Boolean.new( :value => false)
  end

  it "should evaluate its child expression" do
    val = stub "val"
    val.expects(:safeevaluate).with(@scope)

    operator = Puppet::Parser::Expression::Not.new :value => val
    operator.evaluate(@scope)
  end

  it "should return true for ! false" do
    operator = Puppet::Parser::Expression::Not.new :value => @false_ast
    operator.evaluate(@scope).should == true
  end

  it "should return false for ! true" do
    operator = Puppet::Parser::Expression::Not.new :value => @true_ast
    operator.evaluate(@scope).should == false
  end

end