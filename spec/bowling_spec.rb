require 'bowling'

describe Bowling do
  let(:bowling) { subject }

  it 'returns a score of 0 when no pins are hit' do
    20.times { bowling.roll(0) }
    expect(bowling.total_score).to eq(0)
  end

  it 'returns a score of 1 when a pin is hit' do
    bowling.roll(1)
    19.times { bowling.roll(0) }
    expect(bowling.total_score).to eq(1)
  end

  it 'returns correct score when pins are hit in first frame only' do
    bowling.roll(3)
    bowling.roll(4)
    18.times { bowling.roll(0) }
    expect(bowling.total_score).to eq(7)
  end

  it 'returns correct score when pins are hit in second frame only' do
    2.times { bowling.roll(0) }
    bowling.roll(6)
    bowling.roll(3)
    16.times { bowling.roll(0) }
    expect(bowling.total_score).to eq(9)
  end

  it 'returns correct score when pins are hit in every frame' do
    scores = [1, 3, 5, 4, 8, 1, 9, 0, 7, 2, 6, 2, 3, 4, 0, 5, 7, 0, 4, 5]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(76)
  end

  it 'returns correct score when spare in first frame' do
    scores = [7, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(20)
  end

  it 'returns correct score when spare in second frame' do
    scores = [0, 0, 5, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(12)
  end

  it 'returns correct score when two consecutive spares' do
    scores = [0, 0, 5, 5, 8, 2, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(33)
  end

  it 'returns correct score when strike in first frame' do
    scores = [10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(26)
  end

  it 'returns correct score when strike in third frame' do
    scores = [0, 0, 0, 0, 10, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 2]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(29)
  end

  it 'returns correct score when two consecutive strikes' do
    scores = [0, 0, 10, 10, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(40)
  end

  it 'returns correct score when spare on last frame' do
    scores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 9, 4]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(14)
  end

  it 'returns correct score when strike on last frame' do
    scores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 4]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(17)
  end

  it 'returns correct score when strike on last frame and bonus roll' do
    scores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10]
    scores.each { |score| bowling.roll(score) }
    expect(bowling.total_score).to eq(20)
  end
end
