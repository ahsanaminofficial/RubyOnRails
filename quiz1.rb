require 'csv'
require 'time'
require 'timeout'


class Quiz
    def initialize inp
        @data = inp
    end

    def start
        puts "Quiz Number 1"
        timeLimit = 5

        puts "Press enter to start the timer..."
        temp = gets

        start_time = Time.now
        current_time = Time.now
        i = 0
        total = @data.length
        correct = 0

        puts Time.now
        puts Time.now + 10

        while current_time < start_time + timeLimit do
            if i > @data.length - 1
                break
            end
            puts @data[i][0]
            ans = Timeout::timeout(timeLimit - (current_time - start_time)) {
                gets
            }
            ans = ans.strip()

            if (ans <=> @data[i][1]) === 0
                correct += 1
            end
            i += 1
            current_time = Time.now
        end

    rescue Timeout::Error
        puts "Quiz timer has expired"

        puts "Total number of questions were: " + total.to_s
        puts "Correct answers were: " + correct.to_s

    end

end










data = CSV.read("problems.csv")
# puts data[0][0]
# puts data[0][1]

quiz_obj = Quiz.new(data)
quiz_obj.start()


