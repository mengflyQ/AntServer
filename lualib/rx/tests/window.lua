describe('window', function()
  it('produces an error if its parent errors', function()
    local observable = Rx.Observable.of(''):map(function(x) return x() end)
    expect(observable).to.produce.error()
    expect(observable:window(2)).to.produce.error()
  end)

  it('fails if size is not specified', function()
    expect(function () Rx.Observable.fromRange(5):window() end).to.fail()
  end)

  it('produces a specified number of the most recent values', function()
    expect(Rx.Observable.fromRange(3):window(2)).to.produce({{1, 2}, {2, 3}})
    expect(Rx.Observable.fromRange(3):window(3)).to.produce({{1, 2, 3}})
  end)
end)