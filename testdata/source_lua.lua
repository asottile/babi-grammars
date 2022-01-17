-- create class
Account = {balance = 0}


-- constructor
function Account:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

-- method `deposit'
function Account:deposit (v)
  self.balance = self.balance + v
end

-- method `withdraw'
function Account:withdraw (v)
  if v > self.balance then error"insuficient funds" end
  self.balance = self.balance - v
end


-- use example
a = Account:new()
print(a.balance)      --> 0
a:deposit(1000.00)
a:withdraw(100.00)
print(a.balance)      --> 900
